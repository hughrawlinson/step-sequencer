class file {
  void readFromWebsite(int id, matrix m) {
    m.init();
    String query = "http://www.codeoclock.net/stepsequencer/grab.php?data="+id;
    String[] response = loadStrings(query);
    //println(response[0]);
    response[0] = response[0].substring(2, response[0].length() - 3);
    response[0] = response[0].replace("],[",",,");
    String[][] responsestr= new String[0][0];
    String[] values = response[0].split(",,");
    for(int i = 0; i < values.length; i++){
      String[] valuesarr = values[i].split(",");
      for(int j = 0; j < valuesarr.length; j++){
        m.setBeat(i,parseInt(valuesarr[j]));
      }
    }
    println(responsestr);
  }
  void writeAndUpload(int[][] data) {
    JSONArray d = new JSONArray();
    for (int i = 0; i < data.length;i++) {
      d.put(data[i]);
    }
    String query = "http://www.codeoclock.net/stepsequencer/upload.php?data="+d;
    String[] response = loadStrings(query);
    println(response[0]);
    /*
    I tried to use JOptionPane to display the id number (Processing 2.0b3)
    but it didn't work. It just pops up a blank window with no message and
    no 'ok' button. Uncomment the code below to see.
    JOptionPane.showMessageDialog(frame, "ID Number: " + response[0]);
    */
  }
}

