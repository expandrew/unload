# Unload

unload is for uploading files to Dropbox from the web.

It scratches an itch for a photo retouching business that handles batch photo uploads.

# Project Notes / Development Log

Probably TMI but these are my process notes, mainly for my own reference.

*Tools*
- [suspenders](https://github.com/thoughtbot/suspenders)
- [bootstrap-sass](https://github.com/twbs/bootstrap-sass)
- [dropzonejs-rails](https://github.com/ncuesta/dropzonejs-rails)
- [paperclip-dropbox](https://github.com/janko-m/paperclip-dropbox)
- [dotenv](https://github.com/bkeepers/dotenv)

*Useful*
- [Nested Routes](https://gist.github.com/jhjguxin/3074080)
- [Dropzone Bootstrap](http://www.dropzonejs.com/bootstrap.html) (look at source)
- [Dropzone to Paperclip](https://gist.github.com/Joseph-N/a57bd165ec4860fce10d)
- [Multiple File Uploads With Dropzone](https://richonrails.com/articles/multiple-file-uploads-with-dropzone)
- [Paperclip to Dropbox](https://github.com/janko-m/paperclip-dropbox)

## Flow

**Client**
- receives email with url upload url for project (/upload/4Ac0De)
- goes to url, sees uploader view and drops files (no login, the code was in the url)
- or, goes to upload index, enters code and gets taken to uploader view for that code

**Dashboard**
- Special url/route (/dashboard); protected by sign-in password (no multi-user support yet for MVP)
- CRUD folders; (:folder has_many :upload_receipts)
- CRUD @folder.upload_code (update just drops/regenerates the code)
- xRxx upload_receipts (each uploaded file will generate an upload receipt)
- xxUx Dashboard password (in Settings)

**Application**
- File uploads to modified Dropzone (base on [Dropzone Bootstrap](view-source:www.dropzonejs.com/bootstrap.html) source)
- Dropzone pushes file to Rails via Paperclip (follow [Dropzone Paperclip](https://gist.github.com/Joseph-N/a57bd165ec4860fce10d) tutorial)
- Paperclip pushes file to Dropbox using [paperclip-dropbox](https://github.com/janko-m/paperclip-dropbox) gem

## Models

### Folder

**Stories** 
- Admin user can CRUD a folder
- Admin user can set an upload code for a folder
- Admin user can xRxx upload_receipts on folder
- Admin user can view a folder's uploads to see what files have been uploaded

**Associations**  
`has_many :uploads`

**Table Columns**
```ruby
name :string
id :index
upload_code :string (SecureRandom.urlsafe_base64(3))
```

**Scaffold**  
`rails generate scaffold folder name:string`

### Upload

**Stories**
- Client user can create an upload from the Upload View
- Admin user can see uploads for a particular folder

**Associations**  
`belongs_to :folder`

**Generators**  
- `rails generate model upload image:attachment`
- `rails generate controller uploads index new create`

(bootstrapped from Rich on Rails [Multiple File Uploads With Dropzone](https://richonrails.com/articles/multiple-file-uploads-with-dropzone))

## Upload View

**Stories**
- Client goes to special URL (http://u.pxlvue.com/upload/4ac0De) and sees uploader for the corresponding Folder with that upload code

(base template at `/layouts/uploads.html.erb`)


## Curveballs

- generate `ENV['SECRET_KEY_BASE']` with `% rake secret`
- generate Dropbox credentials with `% rake dropbox:authorize APP_KEY=your_app_key APP_SECRET=your_app_secret ACCESS_TYPE=dropbox|app_folder`


# Suspenders README

## Getting Started

After you have cloned this repo, run this setup script to set up your machine
with the necessary dependencies to run and test this app:

    % ./bin/setup

It assumes you have a machine equipped with Ruby, Postgres, etc. If not, set up
your machine with [this script].

[this script]: https://github.com/thoughtbot/laptop

After setting up, you can run the application using [foreman]:

    % foreman start

If you don't have `foreman`, see [Foreman's install instructions][foreman]. It
is [purposefully excluded from the project's `Gemfile`][exclude].

[foreman]: https://github.com/ddollar/foreman
[exclude]: https://github.com/ddollar/foreman/pull/437#issuecomment-41110407

## Guidelines

Use the following guides for getting things done, programming well, and
programming in style.

* [Protocol](http://github.com/thoughtbot/guides/blob/master/protocol)
* [Best Practices](http://github.com/thoughtbot/guides/blob/master/best-practices)
* [Style](http://github.com/thoughtbot/guides/blob/master/style)

## Deploying

If you have previously run the `./bin/setup` script,
you can deploy to staging and production with:

    $ ./bin/deploy staging
    $ ./bin/deploy production
