Pogen
=====
[![Coverage Status](https://coveralls.io/repos/XanderGlassman/pogen/badge.png)](https://coveralls.io/r/XanderGlassman/pogen)
### What is Pogen?

Pogen is a poem generation web application based on user inputs. The user is able to uplaod books to the database and as a result, generate Sestina and Haiku sytle poetry compiled by the Pogen application logic, using words from the uploaded literary works. 

### Getting Started
<ol>
<li>Pull the code down from this GitHub repo:</li>
<pre><code>
$ git clone https://github.com/XanderGlassman/pogen.git
</code></pre>
<li>After navigating into the newly created directory, install bundler if you don't already have it, and then run it:</li>
<pre><code>
$ gem install bundler
</code></pre>
<pre><code>
$ bundle install
</code></pre>
<li>Create, migrate and seed your database:</li>
<pre><code>
$ bundle exec rake db:create
$ bundle exec rake db:migrate
$ bundle exec rake db:seed
</code></pre>
<li>Get the rails server up and running:</li>
<pre><code>
$ rails s
</code></pre>
</ol>
Navigate to http://localhost.3000 to start using Pogen immediately!!

### Dependencies

Since Pogen is a simple rails app, running the bundler should grab all required components needed for this app to run, download them and install them. Also, because the dictionary database exceeds 50,000 rows, heroku will not be able to host this site for free. There are other ways around this, where the database can be stored on amazon (or like service) and the app can still run from a heroku site. 

### Using Pogen

Pogen is a really simple web application that can be run locally or hosted through a service. It offers basic user authentication allowing for separate accounts. Any user can upload books or other literary works (which will become instantly available to all other users), and generate poetry from any selected work of their choosing. 

### Licensing Information

The MIT License

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
