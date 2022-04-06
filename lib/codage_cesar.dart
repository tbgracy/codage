class codage_cesar{
  static const LETTERS = 'abcdefghijklmnopqrstuvwxyz';

  static String encode(String message, int key, [bool encode=true]){
    String res = '';
    message = message.toLowerCase();

    for (int i=0; i<message.length; i++){
      if (!LETTERS.contains(message[i])){
        res += message[i];
      }
      else{
        int letterIndex = LETTERS.indexOf(message[i]);
        res += LETTERS[(encode ? letterIndex + key : letterIndex - key) % 26];
      }
    }
    
    [].forEach((element) { })
    return res;
  }

}