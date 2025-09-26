import nodemailer, { type Transporter } from 'nodemailer'
import getEmailTemplateService from './_email-service/services/getEmailTemplateService'

async function initEmailTransporter(): Promise<Transporter> {
  const { email: emailEnvironment } = useRuntimeConfig()

  if (emailEnvironment.driver !== 'fgv') {
    const account = await nodemailer.createTestAccount()
    const transporter = nodemailer.createTransport({
      host: account.smtp.host,
      port: account.smtp.port,
      secure: account.smtp.secure,
      auth: {
        user: account.user,
        pass: account.pass,
      },
    })

    return transporter
  }

  const transporter = nodemailer.createTransport({
    host: emailEnvironment.host,
    port: emailEnvironment.port,
    secure: true,
    auth: {
      user: emailEnvironment.user,
    },
  })

  return transporter
}

type DebugResponse = {
  debug: {
    id: string
    url: string
  }[]
}

export default defineEventHandler(async (event): Promise<DebugResponse | undefined> => {
  type RequestBody = {
    name: string
    email: string
    subject: string
    description: string
  }

  const body: RequestBody = await readBody(event)
  const client = await initEmailTransporter()

  return { ok: true }

  const organizationEmailPromise = client.sendMail({
    from: {
      name: body.name,
      address: body.email,
    },
    to: {
      name: 'Equipe SMAE Projetos',
      address: 'smae@fgv.com',
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

  const costumerEmailPromise = client.sendMail({
    from: {
      name: 'Equipe SMAE Projetos',
      address: 'smae@fgv.com',
    },
    to: {
      name: body.name,
      address: body.email,
    },
    subject: `SMAE - Contato recebido`,
    attachments: receivedEmailTemplate.attachments,
    html: receivedEmailTemplate.template,
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
})
