import plotly.plotly as py
import plotly.graph_objs as go

# Account initialize
py.sign_in("get_sapta", "3KoqZgFH6CKWmkdCTho2")

#def plot_summary(datadict):
def plot_summary():
    labels=['cancelled', 'pending', 'complete']
    values=[7, 3, 5]
#    for k, v in datadict.items():
#        labels+=[str(k)]
#        values+=[str(v)]
    colors = ['#FEBFB3', '#E1396C', '#96D38C']

    trace = go.Pie(labels=labels, values=values,
               hoverinfo='label+percent', textinfo='value',
               textfont=dict(size=20),
               marker=dict(colors=colors,
                           line=dict(color='#000000', width=2)))
    return trace
#    py.iplot([trace], filename='styled_pie_chart')

# x = {"cancelled":"5", "pending":"7", "complete":"3"}
# plot_summary(x)