gulp = require("gulp")
less = require("gulp-less")
jade = require("gulp-jade")
clean = require("gulp-clean")

gulp.task "less", ->
    gulp.src("style.less")
        .pipe(less())
        .pipe(gulp.dest("."))

gulp.task "jade", ->
    gulp.src("index.jade")
        .pipe(jade({pretty: true}))
        .pipe(gulp.dest("."))

gulp.task "clean", ->
    gulp.src(["dist/"], {read: false})
        .pipe(clean())

gulp.task "default", ["clean"], ->
    gulp.start 'less', 'jade'
    gulp.watch ["style.less"], ["less"]
    gulp.watch ["index.jade"], ["jade"]
