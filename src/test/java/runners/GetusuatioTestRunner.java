package runners;

import com.intuit.karate.junit5.Karate;

public class GetusuatioTestRunner {

    @Karate.Test
    public Karate runGetUsuarios()
    {
        return Karate.run("classpath:features/usuarios/GetUsuarios.feature");


    }
}
