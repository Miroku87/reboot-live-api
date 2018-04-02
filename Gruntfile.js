module.exports = function (grunt) {

    // Time how long tasks take. Can help when optimizing build times
    require('time-grunt')(grunt);

    // Automatically load required grunt tasks
    require('jit-grunt')(grunt);

    grunt.initConfig({

        config: grunt.file.readJSON('gruntconfig.json'),

        clean : {
            build : {
                files : [{
                    dot : true,
                    src : [
                        './dist'
                    ]
                }]
            }
        },

        copy : {
            build : {
                files : [{expand: true, cwd: 'src/', src: ['**'], dest: './dist'}]
            }
        },

        replace : {
            import_paths: {
                options: {
                    patterns: [
                        {
                            match: /(\$path = \$_SERVER\['DOCUMENT_ROOT']\.)"\/reboot-live-api\/src\/";/,
                            replacement: '$1"/";'
                        }
                    ]
                },
                files: [
                    {cwd: './dist', expand:true, src: ['**/*.php'], dest: './dist'}
                ]
            },
            site_url_preprod: {
                options: {
                    patterns: [
                        {
                            match: /(\$SITE_URL\s*?=\s)[\s\S]*?;/,
                            replacement: '$1"<%= config.preprod.site_url %>";'
                        }
                    ]
                },
                files: [
                    {cwd: './dist', expand:true, src: ['config/constants.php'], dest: './dist'}
                ]
            },
            site_url_prod: {
                options: {
                    patterns: [
                        {
                            match: /(\$SITE_URL\s*?=\s)[\s\S]*?;/,
                            replacement: '$1"<%= config.prod.site_url %>";'
                        }
                    ]
                },
                files: [
                    {cwd: './dist', expand:true, src: ['config/constants.php'], dest: './dist'}
                ]
            },
            mail_settings: {
                options: {
                    patterns: [
                        {
                            match: /(\$MAIL_ACCOUNT\s*?=\s)[\s\S]*?;/,
                            replacement: '$1"<%= config.prod.mail_account %>";'
                        },
                        {
                            match: /(\$MAIL_PASSWORD\s*?=\s)[\s\S]*?;/,
                            replacement: '$1"<%= config.prod.mail_password %>";'
                        },
                        {
                            match: /(\$MAIL_HOST\s*?=\s)[\s\S]*?;/,
                            replacement: '$1"<%= config.prod.mail_host %>";'
                        },
                        {
                            match: /(\$MAIL_PORT\s*?=\s)[\s\S]*?;/,
                            replacement: '$1"<%= config.prod.mail_port %>";'
                        }
                    ]
                },
                files: [
                    {cwd: './dist', expand:true, src: ['config/constants.php'], dest: './dist'}
                ]
            },
            db_config_prod: {
                options: {
                    patterns: [
                        {
                            match: /("DB_NAME"\s*?=>\s*?)"[\s\S]*?,/,
                            replacement: '$1"<%= config.prod.db_name %>",'
                        },
                        {
                            match: /("DB_USER"\s*?=>\s*?)"[\s\S]*?,/,
                            replacement: '$1"<%= config.prod.db_user %>",'
                        },
                        {
                            match: /("DB_PASS"\s*?=>\s*?)"[\s\S]*?"/,
                            replacement: '$1"<%= config.prod.db_pass %>"'
                        }
                    ]
                },
                files: [
                    {cwd: './dist', expand:true, src: ['config/config.inc.php'], dest: './dist'}
                ]
            },
            db_config_preprod: {
                options: {
                    patterns: [
                        {
                            match: /("DB_NAME"\s*?=>\s*?)"[\s\S]*?,/,
                            replacement: '$1"<%= config.preprod.db_name %>",'
                        },
                        {
                            match: /("DB_USER"\s*?=>\s*?)"[\s\S]*?,/,
                            replacement: '$1"<%= config.preprod.db_user %>",'
                        },
                        {
                            match: /("DB_PASS"\s*?=>\s*?)"[\s\S]*?"/,
                            replacement: '$1"<%= config.preprod.db_pass %>"'
                        }
                    ]
                },
                files: [
                    {cwd: './dist', expand:true, src: ['config/config.inc.php'], dest: './dist'}
                ]
            },
            preprod_no_mails: {
                options: {
                    patterns: [
                        {
                            match: /(\$mail->send\(\);)/g,
                            replacement: '\/\/$1'
                        }
                    ]
                },
                files: [
                    {cwd: './dist', expand:true, src: ['classes/Mailer.class.php'], dest: './dist'}
                ]
            }
        }
    });

    grunt.registerTask('preprod', [
        'clean:build',
        'copy:build',
        'replace:import_paths',
        'replace:preprod_no_mails',
        'replace:mail_settings',
        'replace:db_config_preprod',
        'replace:site_url_preprod'
    ]);

    grunt.registerTask('prod', [
        'clean:build',
        'copy:build',
        'replace:import_paths',
        'replace:mail_settings',
        'replace:db_config_prod',
        'replace:site_url_prod'
    ]);
};