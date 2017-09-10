from flask import Flask, render_template
from dbconnect import connection
from plotgraph import plot_summary
import gc
import os

app = Flask(__name__)

@app.route('/')
def homepage():
    return render_template("main.html")


@app.route('/dashboard/', methods=["GET", "POST"])
def dashboard():
    try:
        c, conn = connection()
        summary = dict()

        c.execute("SELECT COUNT(*) FROM orderlist WHERE status='cancelled'")
        cancelled_order = c.fetchone()[0]
        summary['cancelled_order'] = cancelled_order

        c.execute("SELECT COUNT(*) FROM orderlist WHERE status='pending'")
        pending_order = c.fetchone()[0]
        summary['pending_order'] = pending_order

        c.execute("SELECT COUNT(*) FROM orderlist WHERE status='complete'")
        complete_order = c.fetchone()[0]
        summary['complete_order'] = complete_order


#        mychart = plot_summary(summary)
        mychart = plot_summary()


        # close database connection
        c.close()
        conn.close()
        gc.collect()
        #return render_template("dashboard.html", summary=summary)
        return render_template("dashboard.html", mychart=mychart)

    except Exception as e:
        return str(e)



if __name__ == "__main__":
    #app.run(debug='true')
    app.run(host='0.0.0.0', port=os.getenv('PORT'))