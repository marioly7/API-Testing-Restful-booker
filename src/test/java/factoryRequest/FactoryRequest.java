package factoryRequest;

public class FactoryRequest {

    public static IRequest make(String type){

        IRequest request;

        switch (type.toLowerCase()){
            case "post":
                request = new RequestPost();
                break;
            case "put":
                request = new RequestPut();
                break;
            case "delete":
                request = new RequestDelete();
                break;
            case "patch":
                request = new RequestPatch();
                break;
            default:
                request = new RequestGet();
                break;
        }
        return request;

    }
}
