import nodemailer from 'nodemailer'
import getEmailTemplateService from './_email-service/services/getEmailTemplateService'
import sendEmailService from './_email-service/services/sendEmailService'

type DebugResponse = {
  debug: {
    id: string
    url: string
  }[]
}

export default defineEventHandler(async (event): Promise<DebugResponse | undefined> => {
  const { email: emailEnvironment } = useRuntimeConfig()

  type RequestBody = {
    name: string
    email: string
    subject: string
    description: string
  }

  try {
    const body: RequestBody = await readBody(event)

    const organizationEmailPromise = sendEmailService({
      from: {
        name: body.name,
        address: body.email,
      },
      to: {
        name: 'Equipe SMAE Projetos',
        address: emailEnvironment.destination,
      },
      subject: `Contato: Site SMAE - ${body.subject}`,
      attachments: [],
      html: `
      <h1>Solicitação de proposta - ${body.subject}</h1>
      
      <h2>Contato:</h2>
      <h4>${body.name}</h4>
      <h4>${body.email}</h4>

      <p>${body.description}</p>

      <style>
        h2 {
          margin-bottom: 0;
        }

        h4 {
          margin: 0;
        }
      </style>
    `,
    })

    const receivedEmailTemplate = await getEmailTemplateService('received-email.template.html')

    const origin = getRequestURL(event).origin

    const costumerEmailPromise = sendEmailService({
      from: {
        name: 'Equipe SMAE Projetos',
        address: emailEnvironment.destination,
      },
      to: {
        name: body.name,
        address: body.email,
      },
      subject: `SMAE - Contato recebido`,
      attachments: receivedEmailTemplate.attachments,
      html: receivedEmailTemplate.template.replace('{{origin}}', origin),
    })

    const [organization, costumer] = await Promise.all([organizationEmailPromise, costumerEmailPromise])

    const testUrl = nodemailer.getTestMessageUrl(organization)
    if (!testUrl) {
      return
    }

    return {
      debug: [
        {
          id: organization.messageId as string,
          url: nodemailer.getTestMessageUrl(organization) as string,
        },
        {
          id: costumer.messageId as string,
          url: nodemailer.getTestMessageUrl(costumer) as string,
        },
      ],
    }
  } catch (err) {
    throw createError({
      message: err.message,
      statusCode: 500,
    })
  }
})
