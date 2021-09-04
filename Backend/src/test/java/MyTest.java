import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import model.Doctor;
import model.Patient;
import org.junit.Assert;
import org.junit.Test;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.List;

public class MyTest {

    @Test
    public void testDoctor() throws IOException {

        try {
            URL url = new URL(TestConfig.URL + "doctors");
            HttpURLConnection httpURLConnection = (HttpURLConnection) url.openConnection();
            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(httpURLConnection.getInputStream()));
            String line = "";
            StringBuilder stringBuilder = new StringBuilder();

            while ((line = bufferedReader.readLine()) != null) {
                stringBuilder.append(line);
            }

            Gson gson = new Gson();
            String json = stringBuilder.toString();
            List<Doctor> doctors = gson.fromJson(json, new TypeToken<List<Doctor>>() {
            }.getType());
            System.out.println(doctors.get(0).getName());
            //Actual value based on the database
            //Assert.assertEquals(doctors.get(0).getName(), "Linh Nguyen");


        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}


