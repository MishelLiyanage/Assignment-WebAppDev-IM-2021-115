package com.userservelet.formwebassignment.model;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

public class DataManager {
    private File xmlFile;

    public DataManager(String filePath) {
        this.xmlFile = new File(filePath);
    }

    public Document getDocument() throws Exception {
        DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
        DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
        if (xmlFile.exists()) {
            return dBuilder.parse(xmlFile);
        } else {
            Document doc = dBuilder.newDocument();
            Element rootElement = doc.createElement("entries");
            doc.appendChild(rootElement);
            return doc;
        }
    }

    public void saveDocument(Document doc) throws TransformerException, IOException {
        TransformerFactory transformerFactory = TransformerFactory.newInstance();
        Transformer transformer = transformerFactory.newTransformer();
        DOMSource source = new DOMSource(doc);
        StreamResult result = new StreamResult(new FileWriter(xmlFile));
        transformer.transform(source, result);
    }

    public void addEntry(String name, int age, String email) throws Exception {
        Document doc = getDocument();
        Element root = doc.getDocumentElement();

        Element entry = doc.createElement("entry");
        root.appendChild(entry);

        String timeStamp = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
        entry.setAttribute("id", timeStamp);

        Element nameElement = doc.createElement("name");
        nameElement.appendChild(doc.createTextNode(name));
        entry.appendChild(nameElement);

        Element ageElement = doc.createElement("age");
        ageElement.appendChild(doc.createTextNode(String.valueOf(age)));
        entry.appendChild(ageElement);

        Element emailElement = doc.createElement("email");
        emailElement.appendChild(doc.createTextNode(email));
        entry.appendChild(emailElement);

        saveDocument(doc);
    }

    public void updateEntry(String id, String name, int age, String email) throws Exception {
        Document doc = getDocument();
        NodeList nList = doc.getElementsByTagName("entry");

        for (int temp = 0; temp < nList.getLength(); temp++) {
            Element entry = (Element) nList.item(temp);
            if (entry.getAttribute("id").equals(id)) {
                entry.getElementsByTagName("name").item(0).setTextContent(name);
                entry.getElementsByTagName("age").item(0).setTextContent(String.valueOf(age));
                entry.getElementsByTagName("email").item(0).setTextContent(email);
                break;
            }
        }

        saveDocument(doc);
    }

    public boolean deleteEntry(String id) throws Exception {
        Document doc = getDocument();
        NodeList nList = doc.getElementsByTagName("entry");
        boolean deleted = false;

        for (int temp = 0; temp < nList.getLength(); temp++) {
            Element entry = (Element) nList.item(temp);
            if (entry.getAttribute("id").equals(id)) {
                entry.getParentNode().removeChild(entry);
                deleted = true;
                break;
            }
        }

        if (deleted) {
            saveDocument(doc);
        }

        return deleted;
    }

    public List<Student> getEntries() throws Exception {
        List<Student> entries = new ArrayList<>();
        Document doc = getDocument();
        NodeList nList = doc.getElementsByTagName("entry");

        for (int temp = 0; temp < nList.getLength(); temp++) {
            Element entryElement = (Element) nList.item(temp);
            Student student = new Student();
            student.setId(entryElement.getAttribute("id"));
            student.setName(entryElement.getElementsByTagName("name").item(0).getTextContent());
            student.setAge(Integer.parseInt(entryElement.getElementsByTagName("age").item(0).getTextContent()));
            student.setEmail(entryElement.getElementsByTagName("email").item(0).getTextContent());
            entries.add(student);
        }

        return entries;
    }
}
