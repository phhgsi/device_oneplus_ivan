def FullOTA_InstallBegin(info):
  data = info.input_zip.read("RADIO/dynamic-remove-oplus")
  common.ZipWriteStr(info.output_zip, "dynamic-remove-oplus", data)
  info.script.AppendExtra('update_dynamic_partitions(package_extract_file("dynamic-remove-oplus"));')
  return
