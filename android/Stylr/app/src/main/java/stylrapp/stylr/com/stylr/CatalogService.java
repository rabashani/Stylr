package stylrapp.stylr.com.stylr;

import java.util.List;
import retrofit.Callback;
import retrofit.http.GET;

public interface CatalogService {
    @GET("/__/catalogs/get-catalog-items-by-tag?TagId=18064860")
    void listCatalogs(Callback<List<Catalog>> cb);
}

