fc = {}
fc["申請須知"] =
  type: "@makeform/agreement"
  meta:
    is-required: true
    config:
      display: \inline
      value: "我已詳閱，並同意遵守實習申請須知"

fc["姓名"] =
  meta: is-required: true
  
fc["電子信箱"] =
  meta:
    is-required: true
    term: [ {opset: \string, enabled: true, op: \email, msg: "格式不符", config: {}} ]

fc["聯絡電話"] =
  meta:
    is-required: true
    term: [
      {
        opset: \string, enabled: true, op: \regex, msg: "格式不符",
        config: rule: "^\\d{4}-\\d{6}$|^\\d{2,3}-\\d{7,8}$"
      }
    ]
    config: note: ["填寫格式：0912-345678／02-23456789"]

fc["生日"] =
  type: \@makeform/date
  meta: is-required: true

fc["性別"] =
  type: \@makeform/radio
  meta:
    is-required: true
    config: values: <[女性 男性 自定義]>

fc["就讀"] =
  meta: 
    title: "目前就讀學校、系所、年級？"
    is-required: true

fc["時數限制"] =
  type: \@makeform/radio
  meta:
    title: "本次實習是否為學校要求，並有一定時數限制？"
    is-required: true
    plugin: [
    * type: \dependency
      config:
        values: ["是"]
        is-required: true
        visible: true
        disabled: false
        targets: <[需求時數]>
    ]
    config:
      values: <[是 否]>

fc["需求時數"] =
  meta: 
    title: "請填寫學校規定的實習時數"
    is-required: false
    visible: false
    disabled: true

fc["排班頻率"] =
  type: \@makeform/radio
  meta:
    title: "實習期間，預計的排班頻率"
    is-required: true
    config:
      note: ["Lightbox 開放時間：每週二～六，10：00～19：00"]
      values: <[一周2天 一周3天 一周3天以上]> 
      other: enabled: true, prompt: "其他"

fc["實習類型"] =
  type: \@makeform/checkbox
  meta:
    title: "你希望實習的類型（可複選）？"
    is-required: true
    config:
      values: <[圖資管理 藝術行政 調查研究]>

fc["專長"] =
  type: \@makeform/checkbox
  meta:
    title: "你有哪些專長呢？"
    is-required: true
    config:
      values: <[圖書資訊 調查研究 編輯校對 文案撰寫 社群經營 英／日語 影像記錄 平面設計]>
      other: enabled: true, prompt: "其他"

fc["經驗"] =
  meta: 
    title: "過去有實習經驗嗎？請告訴我們你實習過的單位"
    is-required: true
    config: note: ["過去沒有實習經驗，請填「無」。"]

fc["為什麼想來"] =
  meta: 
    title: "為什麼會想來 Lightbox 實習？"
    is-required: true

fc["簡要分享"] =
  meta: 
    title: "請簡要分享你平常關注哪些議題？"
    is-required: true

fc["期待"] =
  meta: 
    title: "你對本次實習有哪些期待？"
    is-required: true

fc["簡歷"] =
  type: \@makeform/upload
  meta:
    is-required: false
    disabled: true
    title: "請上傳簡歷，讓我們更認識你吧！"
    config: note: ["具學生證、身心障礙證明者，請上傳證件之正面照片。", "支援檔案格式：pdf, doc, docx"]
    term: [
      {
        opset: \file, enabled: true, op: \extension, msg: '檔案格式不符'
        config: str: "pdf,doc,docx"
      }
    ]
