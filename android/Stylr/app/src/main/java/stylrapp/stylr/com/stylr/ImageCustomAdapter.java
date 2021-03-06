package stylrapp.stylr.com.stylr;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.TextView;

import com.squareup.picasso.Picasso;

import java.util.ArrayList;

/**
 * Created by amit on 15/07/2015.
 */
public class ImageCustomAdapter extends ArrayAdapter {
    Context context;
    int layoutResourceId;
    ArrayList<CatalogItem> data = new ArrayList<>();

    public ImageCustomAdapter(Context context, int resource, ArrayList<CatalogItem> items) {
        super(context, resource, items);
        this.context = context;
        this.layoutResourceId = resource;
        this.data = items;
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
//        View row = convertView;
//        RecordHolder holder = null;
//        if (row == null) {
//            LayoutInflater inflater = ((Activity) context).getLayoutInflater();
//            row = inflater.inflate(layoutResourceId, parent, false);
//            holder = new RecordHolder();
//            holder.txtTitle = (TextView) row.findViewById(R.id.item_text);
//            holder.imageItem = (ImageView) row.findViewById(R.id.item_image);
//            row.setTag(holder);
//        } else {
//            holder = (RecordHolder) row.getTag();
//        }
//        CatalogItem item = data.get(position);
//        holder.txtTitle.setText(item.getTitle());
//        holder.imageItem.setImageBitmap(item.getImage());
//        return row;
        final CatalogItem item = data.get(position);

        LayoutInflater inflater = ((Activity) context).getLayoutInflater();
        View catalogItemView = inflater.inflate(R.layout.catalog_item, parent, false);
        final long itemId = item.ItemId;

        catalogItemView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String url = "http://www.shopyourway.com/m/product/" + itemId;
                Intent launchBrowser = new Intent(Intent.ACTION_VIEW, Uri.parse(url));
                context.startActivity(launchBrowser);
            }
        });

        ImageView imageView = (ImageView) catalogItemView.findViewById(R.id.catalogItemImageView);
        Picasso.with(context).load(item.ImageUrl).into(imageView);

        TextView titleView = (TextView) catalogItemView.findViewById(R.id.catalogItemTitleTextView);
        titleView.setText(getSimplifiedName(item.Name));

        TextView priceView = (TextView) catalogItemView.findViewById(R.id.catalogItemPriceTextView);
        priceView.setText("$" + item.Price.toString());

        return catalogItemView;
    }

    private String getSimplifiedName(String name) {
        String[] splitted = name.split("\\s+");
        if(splitted.length < 2)
            return splitted[0];
        return splitted[0] + " " + splitted[1];
    }
}
