import nodemailer, { type Transporter } from 'nodemailer'

async function initEmailTransporter(): Promise<Transporter> {
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

export default defineEventHandler(async (event) => {
  type RequestBody = {
    name: string
    email: string
    subject: string
    description: string
  }

  const body: RequestBody = await readBody(event)
  const client = await initEmailTransporter()

  const message = await client.sendMail({
    from: {
      name: body.name,
      address: body.email,
    },
    to: {
      name: 'Equipe SMAE Projetos',
      address: 'smae@fgv.com',
    },
    subject: `Contato: Site SMAE - ${body.subject}`,
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

  console.log('Message sent: %s', message.messageId)
  console.log('Message URL: (Clique Aqui) %s', nodemailer.getTestMessageUrl(message))

  return { a: 'Hello Nitro' }
})
