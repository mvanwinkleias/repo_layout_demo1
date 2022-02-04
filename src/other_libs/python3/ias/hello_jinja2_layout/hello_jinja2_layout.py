""" Hello, Jinja2 layout! """
import jinja2
import os
import pprint

class IASHelloJinja2Layout:

    class_templates = {
        "hello_template" : {
            "path" : "hello.txt.jinja2",
        },
    }

    def __init__(self):

        # self.template_dir = os.path.dirname(os.path.realpath(__file__))
        # self.template_loader = jinja2.FileSystemLoader( searchpath = self.template_dir )
        # self.template_env = jinja2.Environment( loader = self.template_loader )

        self.templates = {}
        self.templates.update(self.class_templates)

        pprint.pprint(self.templates)
        self.template_env = jinja2.Environment(
            loader = jinja2.PackageLoader(__name__)
        )

    def get_template(self, template_name):

        # return self.template_env.get_template(self.templates[template_name][path])
        # return self.template_env.get_template(self.class_templates[template_name]["path"])
        return self.template_env.get_template(self.templates[template_name]["path"])
        # return self.template_env.get_template("hello.txt.jinja2")

    """ Hello, repo layout! """
    def hello(self): # pylint: disable=no-self-use
        """ This says hello. """
        template = self.get_template("hello_template")
        print(template.render())

    def simple_return(self): # pylint: disable=no-self-use
        """ This just returns something. """
        return 1
