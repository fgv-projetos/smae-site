import nodemailer from 'nodemailer'
import sendEmailService from './_email-service/services/sendEmailService'

type DebugResponse = {
  debug: {
    id: string
    url: string
  }
}

export default defineEventHandler(async (event): Promise<DebugResponse | undefined> => {
  type RequestBody = {
    name: string
    email: string
    acceptTerms: boolean
  }

  const { email: emailEnvironment } = useRuntimeConfig()

  const body: RequestBody = await readBody(event)

  const email = await sendEmailService({
    from: {
      name: body.name,
      address: body.email,
    },
    to: {
      name: 'Equipe SMAE Projetos',
      address: emailEnvironment.destination,
    },
    subject: `Acesso código fonte - ${body.email}`,
    attachments: [],
    html: `
      <h1>Acesso ao código fonte</h1>
      
      <h2>Contato:</h2>
      <h4 style="margin-bottom: 0">${body.name}</h4>
      <h4 style="margin: 0">${body.email}</h4>

      <p>Aceitou termos ${body.acceptTerms ? 'Sim' : 'Não'}</p>
    `,
  })

  const testUrl = nodemailer.getTestMessageUrl(email)
  if (!testUrl) {
    return
  }

  return {
    debug: {
      id: email.messageId as string,
      url: testUrl as string,
    },
  }
})
