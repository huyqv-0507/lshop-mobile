class ValidStringUtf {
  static String convertUtf(String str) {
    str = str.replaceAll('#', '%23');
    str = str.replaceAll('&', '%26');
    str = str.replaceAll('-', '%2D');
    str = str.replaceAll(' ', '%20');
    str = str.replaceAll('"', '%24');
    str = str.replaceAll('(', '%28');
    str = str.replaceAll(')', '%29');
    return str;
  }
}
