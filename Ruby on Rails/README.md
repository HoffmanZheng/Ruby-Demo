# Ruby on Rails Demo

A practice-demo related to the book [《Ruby on Rails Tutorial》](https://www.railstutorial.org/book), which contains several modules including user, login, micropost, follow, integeration test, etc. 

Project display:

![Application Introduction](https://github.com/HoffmanZheng/Ruby-Demo/blob/master/Ruby%20on%20Rails/images/applicaiton_introduction.png)

## Prerequisites

Before you develop a rails application, make sure that your system has the proper prerequisites installed. These include: [Ruby](https://www.ruby-lang.org/en/documentation/installation/)、[SQLite3](https://www.sqlite.org/index.html)、[Node.js](https://nodejs.org/en/download/)、[Yarn](https://classic.yarnpkg.com/en/docs/install#mac-stable).

Install Rails: 

```powershell
gem install rails
```

Install Bundler:

```
gem install bundler
```

Verify that you have everything installed correctly:

```powershell
rails --version
```

## How to build

Clone the project: 

```powershell
git clone https://github.com/HoffmanZheng/Ruby-Demo.git
```

Switch into project directory:

```
cd Ruby-Demo/Ruby\ on\ Rails
```

Install gems required by the project:

```
bundle install
```

Init data in SQLite3: (which could be browsed through [DB Browser for SQLite](https://sqlitebrowser.org/))

```powershell
./bin/rails db:migrate
./bin/rails db:seed
```

Install jQuery and Bootstrap: 

```powershell
yarn add jquery@3.4.1 bootstrap@3.4.1
```

Run the application: visit `http://localhost:3000`

```powershell
./bin/rails server
```

Run the tests in the application:

```powershell
./bin.rails test
```

