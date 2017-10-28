
function generate_pie_chart(data_vals,id,type){
  var localeInd = d3.locale ({
  "decimal": ".",
  "thousands": ",",
  "grouping": [3],
  "currency": ["₹",""],
  "dateTime": "%a %b %e %X %Y",
  "date": "%m/%d/%Y",
  "time": "%H:%M:%S",
  "periods": ["AM", "PM"],
  "days": ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"],
  "shortDays": ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"],
  "months": ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"],
  "shortMonths": ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
  });

  var chart = c3.generate({
    bindto: '#'+id,
    data: {
      columns: data_vals,
      type: type
    },
    tooltip:{
     format:{
        value:function (value, ratio, id) {
            return localeInd.numberFormat("$,.r")(value);
              }
       }
    }
  });
}

function generate_bar_chart(data_vals,id)
{
  var localeInd = d3.locale ({
  "decimal": ".",
  "thousands": ",",
  "grouping": [3],
  "currency": ["₹",""],
  "dateTime": "%a %b %e %X %Y",
  "date": "%m/%d/%Y",
  "time": "%H:%M:%S",
  "periods": ["AM", "PM"],
  "days": ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"],
  "shortDays": ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"],
  "months": ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"],
  "shortMonths": ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
  });

  var chart = c3.generate({
    bindto: '#'+id,
    data: {
      columns: data_vals,
      axes: {
            "Newly Added": 'y2'
            },
      type: 'bar'
    },
    axis: {
        x: {
            type: 'category',
            categories: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        },
        y2: {
            show: true                
        }
    },
    tooltip:{
     format:{
        value:function (value, ratio, id) {
            return localeInd.numberFormat("$,.r")(value);
              }
       }
    }
});
}

function evaluate_data(data,tab_id)
{
  if(data == 0)
  {
    $(tab_id).find('.chart').addClass("hidden");
    $(tab_id).find('.no_data').removeClass("hidden");
  }
  else
  {  
    $(tab_id).find('.no_data').addClass("hidden");
    $(tab_id).find('.chart').removeClass("hidden");
  }
}