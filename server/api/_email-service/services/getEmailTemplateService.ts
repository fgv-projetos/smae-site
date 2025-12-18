import AttachmentsData from '../template/attachmentsData.json'

type AttachmentsItem = {
  filename: string
  path: string
  cid: string
}

type ProcessedAttachmentsItem = {
  filename: string
  content: Buffer
  cid: string
}

type Response = {
  template: string
  attachments?: ProcessedAttachmentsItem[]
}

async function getEmailTemplateService(fileName: string): Promise<Response> {
  const templateStorage = useStorage('assets:email-templates')
  const keys = await templateStorage.getKeys()
  // Use Nitro's useStorage instead of VueUse
  console.log('Available templates:', keys)
  const template = await templateStorage.getItem<string>(fileName)

  if (!template) {
    throw new Error(`Template not found: ${fileName}`)
  }

  const attachmentsData = AttachmentsData as Record<string, AttachmentsItem[]>
  const attachmentsNeededList = attachmentsData[fileName]

  if (!attachmentsNeededList) {
    return { template }
  }

  const imageStorage = useStorage('assets:email-images')

  const computedAttachmentsData = await Promise.all(
    attachmentsNeededList.map(async (item) => {
      const content = await imageStorage.getItemRaw(item.path)

      if (!content) {
        throw new Error(`Image not found: ${item.path}`)
      }

      return {
        cid: item.cid,
        filename: item.filename,
        content: Buffer.from(content as ArrayBuffer),
      }
    }),
  )

  return {
    template,
    attachments: computedAttachmentsData,
  }
}

export default getEmailTemplateService
