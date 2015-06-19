# Unload

unload is for uploading files to Google Drive from the web.

It's built to scratch an itch for a photo retouching business that handles batch photo uploads.

# Project Notes / Development Log

Probably TMI but these are my process notes, mainly for my own reference.

*Tools*
- [suspenders](https://github.com/thoughtbot/suspenders)
- [bootstrap-sass](https://github.com/twbs/bootstrap-sass)
- [dropzonejs-rails](https://github.com/ncuesta/dropzonejs-rails)
- [google-api-client](https://github.com/google/google-api-ruby-client)

*Useful*
- [Nested Routes](https://gist.github.com/jhjguxin/3074080)
- [Dropzone Bootstrap](http://www.dropzonejs.com/bootstrap.html) (look at source)
- [Dropzone to Paperclip](https://gist.github.com/Joseph-N/a57bd165ec4860fce10d)
- [Paperclip to Google Drive](https://github.com/evinsou/paperclip-googledrive)

## Flow

**Client**
- receives email with url upload url for project (http://u.pxlvue.com/c0De)
- goes to url, sees uploader view and drops files (no login, the code was in the url)
- or, goes to upload index, enters code and gets taken to uploader view for that code

**Dashboard**
- Special url/route (http://u.pxlvue.com/a/); protected by sign-in password (no multi-user support yet for MVP)
- CRUD folders; (:folder has_many :upload_receipts)
- CRUD @folder.upload_code (update just regenerates the )
- xRxx upload_receipts (each uploaded file will generate an upload receipt)
- xxUx Dashboard password (in Settings)

**Application**
- File uploads to modified Dropzone (base on [Dropzone Bootstrap](view-source:www.dropzonejs.com/bootstrap.html) source)
- Dropzone pushes file to Rails via Paperclip (follow [Dropzone Paperclip](https://gist.github.com/Joseph-N/a57bd165ec4860fce10d) tutorial)
- Paperclip pushes file to Google Drive using [paperclip-googledrive](https://github.com/evinsou/paperclip-googledrive) gem

## Models

### Folder

**Stories** 
- Admin user can CRUD a folder
- Admin user can set an upload code for a folder
- Admin user can xRxx upload_receipts on folder

**Associations**
`has_many :upload_receipts`

**Table Columns**
```ruby
name :string
id :index
upload_code :string (SecureRandom.urlsafe_base64(3))
```

**Scaffold**
`rails generate scaffold folder name:string`


### Upload Receipt

**Stories**
- Application generates an upload_receipt object for each file uploaded through the app to Drive
- Admin user can view a folder's upload receipts to see what files have been uploaded

**Associations**
`belongs_to :folder`

**Table Columns**
```
file_name: stringid: indexed
folder_id: foreign_key to folders
timestamps
```

**Scaffold**
`rails generate scaffold UploadReceipt file_name:string folder_id:references —timestamps`

## Uploader View

**Stories**
- Client goes to special URL (http://u.pxlvue.com/upload/c0De) and sees uploader for the corresponding Folder with that upload code

**Scaffold**
`rails generate controller Uploader`

(base template at `/layouts/uploader.html.erb`)


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
