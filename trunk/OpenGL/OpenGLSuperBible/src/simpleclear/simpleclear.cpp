/*
 * Copyright ?2012-2013 Graham Sellers
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice (including the next
 * paragraph) shall be included in all copies or substantial portions of the
 * Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
 * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 */

#include <sb6.h>
#include <cmath>

class simpleclear_app : public sb6::application
{
    void init()
    {
        static const char title[] = "OpenGL SuperBible - Simple Clear";

        sb6::application::init();

        memcpy(info.title, title, sizeof(title));
    }

    virtual void render(double currentTime)
    {
       // static const GLfloat red[] = { 1.0f, 0.0f, 0.0f, 1.0f };
		const GLfloat color[] = { (float)sin(currentTime) * 0.5f + 0.5f,
			(float)cos(currentTime) * 0.5f + 0.5f, 0.0f, 1.0f };
        glClearBufferfv(GL_COLOR, 0, color);
		//glPointSize(40.0f);

		glUseProgram(rendering_program);
		// Use the program object we created earlier for rendering
		GLfloat attrib[] = { (float)sin(currentTime) * 0.5f, (float)cos(currentTime) * 0.6f, 0.0f, 0.0f };
		// Update the value of input attribute 0
		glVertexAttrib4fv(0, attrib);
		// Draw one point
		glDrawArrays(GL_TRIANGLES, 0, 3);
    }

	GLuint compile_shaders(void)
	{
		GLuint vertex_shader; 
		GLuint fragment_shader;
		GLuint program;
		// Source code for vertex shader
		static const GLchar * vertex_shader_source[] =
		{
			"#version 430 core \n"
			" \n"
			"layout (location = 0) in vec4 offset; \n"
			"void main(void) \n"
			"{ \n"
			"// Declare a hard-coded array of positions\n"
			"const vec4 vertices[3] = vec4[3](vec4( 0.25, -0.25, 0.5, 1.0),\n"
			"								vec4(-0.25, -0.25, 0.5, 1.0),\n"
			"								vec4( 0.25, 0.25, 0.5, 1.0));\n"
			"// Index into our array using gl_VertexID\n"
			"gl_Position = vertices[gl_VertexID] + offset;\n"
			"} \n"
		};
		// Source code for fragment shader
		static const GLchar * fragment_shader_source[] =
		{
			"#version 430 core \n"
			" \n"
			"out vec4 color; \n"
			" \n"
			"void main(void) \n"
			"{ \n"
			" color = vec4(0.0, 0.8, 1.0, 1.0); \n"
			"} \n"
		};
		// Create and compile vertex shader
		vertex_shader = glCreateShader(GL_VERTEX_SHADER);
		glShaderSource(vertex_shader, 1, vertex_shader_source, NULL);
		glCompileShader(vertex_shader);
		// Create and compile fragment shader
		fragment_shader = glCreateShader(GL_FRAGMENT_SHADER);
		glShaderSource(fragment_shader, 1, fragment_shader_source, NULL);
		glCompileShader(fragment_shader);
		// Create program, attach shaders to it, and link it
		program = glCreateProgram();
		glAttachShader(program, vertex_shader);
		glAttachShader(program, fragment_shader);
		glLinkProgram(program);
		// Delete the shaders as the program has them now
		glDeleteShader(vertex_shader);
		glDeleteShader(fragment_shader);
		return program;
	}

	void startup()
	{
		rendering_program = compile_shaders();
		glGenVertexArrays(1, &vertex_array_object);
		glBindVertexArray(vertex_array_object);
	}
	void shutdown()
	{
		glDeleteVertexArrays(1, &vertex_array_object);
		glDeleteProgram(rendering_program);
		glDeleteVertexArrays(1, &vertex_array_object);
	}

private:
	GLuint rendering_program;
	GLuint vertex_array_object;
};

DECLARE_MAIN(simpleclear_app)
