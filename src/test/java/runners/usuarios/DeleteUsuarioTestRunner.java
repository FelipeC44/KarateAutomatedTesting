package runners.usuarios;

import com.intuit.karate.junit5.Karate;

public class DeleteUsuarioTestRunner {
    @Karate.Test
    public Karate runDeleteUsuario() {
        return Karate.run("classpath:features/usuarios/DeleteUsuario.feature");
    }
}
