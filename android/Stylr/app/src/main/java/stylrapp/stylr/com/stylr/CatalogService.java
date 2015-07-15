package stylrapp.stylr.com.stylr;

import java.util.List;

import retrofit.Callback;
import retrofit.http.GET;

public interface CatalogService {
    @GET("/catalogs")
    void listCatalogs(Callback<List<Catalog>> cb);
}

