String getSectionImage(String section) {
  switch (section) {
    case 'كلية معلوماتية الأعمال':
      return 'assets/images/bic.png';
    case 'كلية الهندسة':
      return 'assets/images/engineering.png';
    case 'كلية المعلوماتية الطبية الحيوية':
      return 'assets/images/1_202421017075892410.png';
    case 'وزارة التعليم العالي والبحث العلمي':
      return 'assets/images/minestry.png';
    default:
      return 'assets/images/uoitc.png';
  }
}
