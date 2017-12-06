//Alnoor, Ali, Grayson


class Log {

    int counter;
    ArrayList <String> journalList;

    public Log(int rcount, int ncount, int speed) {

        counter = 1;
        journalList = new ArrayList<String>();
        journalList.add("Robot Count: " + str(rcount) + ","  +"Node Count: " + str(ncount) + "," + "Robot Speed: " + str(speed));

    }

    public void addtoJournal(String strIn) {

        journalList.add(str(counter++) + "," + strIn);

    }

    public void saveToFile() {

        String[] outStrings = journalList.toArray(new String[journalList.size()]);
        int fileID = 0;

        while ((new File(sketchPath("logs\\log" + str(fileID) + ".csv"))).getAbsoluteFile().exists())
            fileID++;

        saveStrings("logs\\log" + str(fileID) + ".csv", outStrings);
    }

}