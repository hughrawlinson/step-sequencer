class file {
  void readFromWebsite(int id) {
    String query = "http://www.codeoclock.net/stepsequencer/grab.php?data="+id;
    String[] response = loadStrings(query);
    println(response[0]);
    response[0] = response[0].substring(2, response[0].length() - 3);
    String[] something;
    StringBuffer something2;
    response[0] = response[0].replace("],[",",,");
    String[] values = response[0].split(",,");
    int[][] data = new int[1][1];
    for(int i = 0; i < values.length; i++){
      String[] valuesarr = values[i].split(",");
      //println(valuesarr);
      int[] column = new int[0];
      for(int j = 0; j < valuesarr.length; j++){
        column = append(column,parseInt(valuesarr[j]));
      }
      println(column);
      data = (int[][])append(data, column);
    }
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

