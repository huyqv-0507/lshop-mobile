class ValidStringUtf {
  static String convertUtf(String str) {
    str.replaceAll('#', '%23');
    str.replaceAll('&', '%26');
    str.replaceAll('-', '%2D');
    str.replaceAll(' ', '%20');
    str.replaceAll('"', '%24');
    str.replaceAll('(', '%28');
    str.replaceAll(')', '%29');
    return str;
  }
}
