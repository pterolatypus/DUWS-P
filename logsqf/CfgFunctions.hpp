class LogSQF {
  class Functions {
    tag = "LogSQF"
    file = "logsqf\functions";
    class showDebug {description = "Compares a given level to the active logging level to determine if a message sent under that level would be displayed"};
    class debugMessage {description = "Logs the message iff the specified level is sufficient, compared to the currently set logging level"};
  };
};
