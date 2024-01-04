package;

class Command
{
    public var name: String; 
}

class CommandPrint extends Command
{
    public var message: String;

    public function new(message: String)
    {
        this.name = "print";
        this.message = message;
    }
}

class CommandCenter 
{
    public var handlers: Map<String, (Command) -> Void>;

    public function new()
    {
        handlers = [];
    }

    public function pushCommand(command: Command)
    {
        handlers[command.name](command);
    }
}

class Main
{
    public static function main()
    {
        var commandCenter = new CommandCenter();
        commandCenter.handlers["print"] = (command) -> {
            var commandPrint = cast(command, CommandPrint);
            trace(commandPrint.message); 
        };

        commandCenter.pushCommand(new CommandPrint("Hello World"));
    }
}