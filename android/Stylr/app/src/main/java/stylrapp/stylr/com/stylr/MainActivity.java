package stylrapp.stylr.com.stylr;

import android.content.Context;
import android.support.v7.app.ActionBarActivity;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.GridView;
import android.widget.ImageView;
import com.squareup.picasso.Picasso;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import retrofit.Callback;
import retrofit.RestAdapter;
import retrofit.RetrofitError;
import retrofit.client.Response;

public class MainActivity extends ActionBarActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        final MainActivity mainActivity = this;
        fetchCatalogs(new Callback<List<Catalog>>() {
            @Override
            public void success(List<Catalog> catalogs, Response response) {
                Catalog catalog = catalogs.get(0);
                setCatalogImage(catalog, mainActivity);
                setCatalogItems(catalog, mainActivity);
            }

            @Override
            public void failure(RetrofitError error) {

            }
        });
    }

    private void setCatalogImage(Catalog catalog, Context context) {
        ImageView imageView = (ImageView) findViewById(R.id.imageView);
        Picasso.with(context).load("http:" + catalog.catalogImageUrl).into(imageView);
    }

    private void setCatalogItems(Catalog catalog, Context context) {
        GridView gridView = (GridView) findViewById(R.id.gridView);
        ImageCustomAdapter adapter = new ImageCustomAdapter(context, android.R.layout.simple_list_item_1, new ArrayList<>(Arrays.asList(catalog.VisualItems)));
        gridView.setAdapter(adapter);
    }

    private void fetchCatalogs(Callback<List<Catalog>> callback) {
        RestAdapter restAdapter = new RestAdapter.Builder().setEndpoint("http://www.shopyourway.com").build();
        CatalogService service = restAdapter.create(CatalogService.class);
        service.listCatalogs(callback);
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_main, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == R.id.action_settings) {
            return true;
        }

        return super.onOptionsItemSelected(item);
    }
}
