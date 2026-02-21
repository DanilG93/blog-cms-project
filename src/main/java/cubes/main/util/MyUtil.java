package cubes.main.util;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public class MyUtil {

	public static String generateSeoUrl(String title) {

		if (title == null || title.isEmpty()) {
			return "";
		}

		String seoUrl = title.trim().toLowerCase();
		seoUrl = seoUrl.replace("č", "c").replace("ć", "c").replace("š", "s").replace("ž", "z").replace("đ", "dj");
		seoUrl = seoUrl.replaceAll("[^a-z0-9]", "-");
		seoUrl = seoUrl.replaceAll("-+", "-").replaceAll("^-|-$", "");
		return seoUrl;
	}
	
	public static String saveImage(MultipartFile file, String folderName, HttpServletRequest request) {
		
        if (file.isEmpty()) {
            return null;
        }

        try {
            String uploadDir = "/resources/uploads/" + folderName + "/";
            String realPath = request.getServletContext().getRealPath(uploadDir);

            File dir = new File(realPath);
            if (!dir.exists()) {
                dir.mkdirs();
            }

            String fileName = file.getOriginalFilename();
            File destination = new File(realPath + File.separator + fileName);
            file.transferTo(destination);

            return fileName;
            
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }

}
