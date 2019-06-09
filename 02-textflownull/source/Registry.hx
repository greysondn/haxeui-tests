package;

/**
 * Dead simple registry (singleton) for haxeui in flixel
 * 
 * Not pretty, but gets the job done
 */
class Registry
{
    /**
     * whether or not haxeui-flixel has been initialized
     */
    public var initialized:Bool = false;

    /**
     * Instance of this class. The only.
     */
    private static var instance:Registry;

    private function new()
    {
        // does nothing, non?
    }

    public static function create():Registry
    {
        // make sure instance exists
        if (null == Registry.instance)
        {
            Registry.instance = new Registry();
        }

        return Registry.instance;
    }
}