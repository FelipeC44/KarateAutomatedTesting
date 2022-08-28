package runners;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

public class ExecucaoGeralTestRunner {

    @Test
    public void runExecucaoGeralParalela()
    {
        Runner.Builder builder = new Runner.Builder();
        builder.path("classpath:features");
        builder.tags("@smoke"); //cenario de smoke tests a partir da tag
        Results result = builder.parallel(5);
        Assertions.assertEquals(0, result.getFailCount()); //validador de cenarios de erros

    }
}