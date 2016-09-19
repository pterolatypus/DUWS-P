class Params {
    class Loglevel {
        title = "Loggin Level";
        values[] = {"ALL", "TRACE", "DEBUG", "INFO", "WARNING", "ERROR"};
        texts[] = {"ALL", "TRACE", "DEBUG", "INFO", "WARNING", "ERROR"};
        default = true;
    };

    class DeathPenalty {
        title = "CP death penalty";
        values[] = {1,2,3,4,5,6,7,8,9,10,0};
        texts[] = {"1","2","3","4","5","6","7","8","9","10","No penalty"};
        default = 1;
    };
}
