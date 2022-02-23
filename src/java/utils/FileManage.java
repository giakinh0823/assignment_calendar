/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Random;
import javax.servlet.http.Part;

/**
 *
 * @author giaki
 */
public class FileManage {

    public String upLoad(Part part, String folder) throws IOException {
        String file = Paths.get(part.getSubmittedFileName()).getFileName().toString();
        Path path = Paths.get(folder);

        if (!Files.exists(path)) {
            Files.createDirectory(path);
        }

        InputStream inputStream = null;
        OutputStream outputStream = null;
        try {
            File outputFilePath = new File(Paths.get(path.toString(), file).toString());
            if (outputFilePath.exists()) {
                Random random = new Random();
                file = random.nextInt(1000000000)+"-"+file.replaceAll("\\s+", "-");
                outputFilePath = new File(Paths.get(path.toString(), file).toString());
            }
            inputStream = part.getInputStream();
            outputStream = new FileOutputStream(outputFilePath);
            int read = 0;
            final byte[] bytes = new byte[1024];
            while ((read = inputStream.read(bytes)) != -1) {
                outputStream.write(bytes, 0, read);
            }
        } catch (Exception e) {
            e.printStackTrace();
            file = "";
        } finally {
            if (outputStream != null) {
                outputStream.close();
            }
            if (inputStream != null) {
                inputStream.close();
            }
        }
        return file;
    }

    public void delete(String fileName, String folder) throws IOException {
        Path path = Paths.get(folder);
        try {
            File file = new File(Paths.get(path.toString(), fileName).toString());
            file.delete();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
