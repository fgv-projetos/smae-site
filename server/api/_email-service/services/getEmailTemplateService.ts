import type { ReadStream } from 'fs'
import { createReadStream } from 'fs'
import { readFile } from 'fs/promises'

import { join } from 'path'

import AttachmentsData from '../template/attachmentsData.json'

type AttachmentsItem = {
  filename: string
  path: string
  cid: string
}

type ProcessedAttachmentsItem = {
  filename: string
  content: ReadStream
  cid: string
}

type Response = {
  template: string
  attachments?: ProcessedAttachmentsItem[]
}

async function getEmailTemplateService(fileName: string): Promise<Response> {
  const filePath = join(process.cwd(), 'server', 'api', '_email-service', 'template', fileName)
  const template = await readFile(filePath, 'utf-8')

  const attachmentsData = AttachmentsData as Record<string, AttachmentsItem[]>
  const attachmentsNeededList = attachmentsData[fileName]
  if (!attachmentsNeededList) {
    return {
      template,
    }
  }

  const computedAttachmentsData = attachmentsNeededList.map((item) => {
    const filename = join(process.cwd(), 'server', 'api', '_email-service', 'images', item.path)
    const content = createReadStream(filename)

    return {
      cid: item.cid,
      filename: item.filename,
      content: content,
    }
  })

  console.log(computedAttachmentsData)
  return {
    template,
    attachments: computedAttachmentsData,
  }
}

export default getEmailTemplateService
