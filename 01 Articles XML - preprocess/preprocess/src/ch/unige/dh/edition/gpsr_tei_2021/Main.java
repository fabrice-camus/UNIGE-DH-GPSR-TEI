package ch.unige.dh.edition.gpsr_tei_2021;

import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

public class Main {
    private static final String BASE_PATH_SRC = "../../00 Articles Sources XML-Trèves/";
    private static final String BASE_PATH_DEST = "../";
    private static Map<String,Integer> tomes;

    private static List<String> findReplace(List<String> source, String find, String replaceBy) {

        List<String> updatedSrc = new ArrayList<>();

        for (String line : source) {
            updatedSrc.add(line.replace(find, replaceBy));
        }


        return updatedSrc;
    }
    private static List<String> executeRegex(List<String> source, String regex, String replaceBy) {
        Pattern pattern = Pattern.compile(regex);
        int countTotal = 0;
        int count;
        List<String> sourceModifiee = new ArrayList<>();
        for (String ligne : source) {
            Matcher matcher = pattern.matcher(ligne);
            //int from = 0;
            count = 0;
            while (matcher.find()) {
                //while (matcher.find(from)) {
                count++;
                //from = matcher.start() + 1;
            }

            sourceModifiee.add(ligne.replaceAll(regex, replaceBy));
            countTotal = countTotal + count;
        }
        return sourceModifiee;
    }
    private static void initTomesNumber(){
        tomes = new HashMap<>();
        tomes.put("AGRAFER.xml",1);
    }



    public static void main(String[] args) {
        List<File> files = null;
        List<String> xmlcontent = null;

        initTomesNumber();


        //Get xml files from directory
        try {
            files = Files.list(Paths.get(BASE_PATH_SRC))
                    .filter(Files::isRegularFile)
                    .filter(path -> path.toString().endsWith(".xml"))
                    .map(Path::toFile)
                    .collect(Collectors.toList());
        } catch (IOException e) {
            e.printStackTrace();
        }


        for (File fileInPath: files) {

            Path myXMLFile = new File(BASE_PATH_SRC+fileInPath.getName()).toPath();
            try {
                 xmlcontent = Files.readAllLines(myXMLFile, StandardCharsets.UTF_8);
            } catch (IOException e) {
                e.printStackTrace();
            }


            //Find-Replace
            //Spécifique AGRAFER
            xmlcontent = findReplace(xmlcontent,"<b><i>agraf\uEC50</i></b>","<i><b>agraf\uEC50</b></i>");

            //Communs
            xmlcontent = findReplace(xmlcontent,"<i>Dict.</i>","<bibl>Dict.</bibl>");
            xmlcontent = findReplace(xmlcontent,"<i>Suppl.</i>","<bibl>Suppl.</bibl>");
            xmlcontent = findReplace(xmlcontent,"<c>V</c> <c>Ba.,</c>","<c>V Ba.,</c>");
            xmlcontent = findReplace(xmlcontent,"—","<pc>—</pc>");
            xmlcontent = findReplace(xmlcontent,"Mo.","<c>Mo.</c>");

            xmlcontent = findReplace(xmlcontent,"<art","<art tome=\""+tomes.get(fileInPath.getName())+"\"");

            xmlcontent = findReplace(xmlcontent,"<P>‖","<P><g>‖</g>");

            //Etendre pour les autres cas
            xmlcontent = findReplace(xmlcontent,"V. tr.","<gramGrp>V. tr.</gramGrp>");

            //Marquer les références utilisées comme usg type=geo des citations
            xmlcontent = executeRegex(xmlcontent,"(\\([A-Z<]+.+?\\))\\.","<refUsg>$1</refUsg>.");

            //Write into file
            try {
                Path newXMLFile = new File(BASE_PATH_DEST+fileInPath.getName()).toPath();
                Files.write(newXMLFile, xmlcontent, StandardCharsets.UTF_8);
            } catch (IOException e) {
                e.printStackTrace();
            }


        }



    }
}
