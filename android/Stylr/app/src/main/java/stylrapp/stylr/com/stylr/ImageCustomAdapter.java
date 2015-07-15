package stylrapp.stylr.com.stylr;

import android.app.Activity;
import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.List;

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
        TextView textView = new TextView(context);
        textView.setText(data.get(position).name);
        return textView;
    }

    static class RecordHolder {
        TextView txtTitle;
        ImageView imageItem;
    }
}
