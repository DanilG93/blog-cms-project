package cubes.main.dao.util;

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

}
