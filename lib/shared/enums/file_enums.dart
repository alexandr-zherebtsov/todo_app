enum FileEnums {
  image,
  video,
}

const Map<String, FileEnums> mapFileEnums = <String, FileEnums> {
  'GIF': FileEnums.image,
  'JPEG': FileEnums.image,
  'JPG': FileEnums.image,
  'PNG': FileEnums.image,
  'TIFF': FileEnums.image,
  'gif': FileEnums.image,
  'jpeg': FileEnums.image,
  'jpg': FileEnums.image,
  'png': FileEnums.image,
  'tiff': FileEnums.image,
  'MP4': FileEnums.video,
  'mp4': FileEnums.video,
};
