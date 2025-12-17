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

  const body: RequestBody = await readBody(event)

  const email = await sendEmailService({
    from: {
      name: body.name,
      address: body.email,
    },
    to: {
      name: 'Equipe SMAE Projetos',
      address: 'smae@fgv.com',
    },
    subject: `Acesso código fonte - ${body.email}`,
    attachments: [],
    html: `
      <h1>Acesso ao código fonte</h1>
      
      <h2>Contato:</h2>
      <h4>${body.name}</h4>
      <h4>${body.email}</h4>

      <p>Aceitou termos ${body.acceptTerms ? 'Sim' : 'Não'}</p>

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
