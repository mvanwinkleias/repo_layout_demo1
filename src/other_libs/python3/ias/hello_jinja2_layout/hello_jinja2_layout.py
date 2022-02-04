""" Hello, Jinja2 layout! """
# import os
# import pprint

import jinja2
class IASHelloJinja2Layout:
    """ Hello, Jinja2 layout! """
    class_templates = {
        "hello_template" : {
            "text" : {
                "file_name" : "hello.txt.jinja2",
            },
        },
    }

    def __init__(self):
        """ Initializes the object. """

        self.templates = {}
        self.templates.update(self.class_templates)

        self.template_env = jinja2.Environment(
            loader=jinja2.PackageLoader(__name__)
        )

    def get_template(self, template_name, format_type):
        """ Returns a template. """

        return self.template_env.get_template(
            self.templates[template_name][format_type]["file_name"]
        )

    def hello(self): # pylint: disable=no-self-use
        """ This says hello. """
        template = self.get_template("hello_template", "text")
        print(template.render())
