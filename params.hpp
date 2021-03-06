class Params {
    class Loglevel {
        title = "Logging Level";
        values[] = {"ALL", "TRACE", "DEBUG", "INFO", "WARNING", "ERROR"};
        texts[] = {"ALL", "TRACE", "DEBUG", "INFO", "WARNING", "ERROR"};
        default = "INFO";
    };

    class DeathPenalty {
        title = "CP death penalty";
        values[] = {1,2,3,4,5,6,7,8,9,10,0};
        texts[] = {"1","2","3","4","5","6","7","8","9","10","No penalty"};
        default = 0;
    };
}
