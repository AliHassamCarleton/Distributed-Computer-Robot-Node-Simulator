//Alnoor, Ali, Grayson

class Log {

    int counter;
    ArrayList <String> journalList;

    public Log(int rcount, int ncount, int speed) {

        counter = 1;
        journalList = new ArrayList<String>();
        journalList.add("Settings used:\n");
        journalList.add("# of Robots: " + str(rcount) + "|\n"  +"# of Nodes: " + str(ncount) + "|\n" + "Speed: " + str(speed)+"\n\n");
        

    }

    public void addtoJournal(String strIn) {

        journalList.add("test #" +str(counter++) + "  |  rounds needed: " + strIn);

    }

    public void saveToFile() {

        String[] outStrings = journalList.toArray(new String[journalList.size()]);
        int fileID = 0;

        while ((new File(sketchPath("testcases results/test" + str(fileID) + ".txt"))).getAbsoluteFile().exists())
            fileID++;

        saveStrings("testcases results//test" + str(fileID) + ".txt", outStrings);
    }

}