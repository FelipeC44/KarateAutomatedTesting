package runners.usuarios;

import com.intuit.karate.junit5.Karate;

public class GetUsuariosTestRunner {

    @Karate.Test
    public Karate runGetUsuarios(){
        return Karate.run("classpath:features/usuarios/GetUsuarios.feature");


    }
}
