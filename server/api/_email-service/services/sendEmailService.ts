import type { ReadStream } from 'fs'
import nodemailer, { type Transporter } from 'nodemailer'

type ProcessedAttachmentsItem = {
  filename: string
  content: ReadStream
  cid: string
}

interface EmailPayload {
  from: {
    name: string
    address: string
  }
  to: {
    name: string
    address: string
  }
  subject: string
  attachments: ProcessedAttachmentsItem[] | undefined // pode ser tipado melhor se souber a estrutura dos anexos
  html: string
}

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

async function sendEmailService({ from, to, subject, attachments = [], html }: EmailPayload) {
  const client = await initEmailTransporter()

  const email = await client.sendMail({
    from: from,
    to,
    subject,
    attachments,
    html,
  })

  return email
}

export default sendEmailService
