import React, { useRef } from "react";
import { Formik, Form, Field, useFormik } from "formik";
import * as Yup from "yup";
import BackButton from "../components/BackButton";
import { postUser } from "../api";
import { useNavigate } from "react-router-dom";

const RegisterPage = () => {
  const errorPasswordRef = useRef();
  const errorEmailRef = useRef();
  const navigate = useNavigate();

  const validationSchema = Yup.object().shape({
    voornaam: Yup.string().required("Voornaam is verplicht"),
    achternaam: Yup.string().required("Achternaam is verplicht"),
    email: Yup.string()
      .email("Ongeldig e-mailadres.")
      .required("E-mail is verplicht."),
    password: Yup.string().required("Wachtwoord is verplicht."),
    confirmPassword: Yup.string().required("Bevestig wachtwoord is verplicht."),
  });

  const { values, handleSubmit, handleChange, dirty, isValid } = useFormik({
    initialValues: {
      voornaam: "",
      achternaam: "",
      email: "",
      password: "",
      confirmPassword: "",
    },
    onSubmit: async (values) => {
      if (values.password !== values.confirmPassword) {
        const errTextPass = errorPasswordRef.current;
        errTextPass.style.display = "block";
      } else {
        const newUser = {
          voornaam: values.voornaam,
          achternaam: values.achternaam,
          email: values.email,
          wachtwoord: values.password,
        };

        try {
          const response = await postUser(newUser);
          console.log("Gebruiker geregistreerd:", response.data);
          window.location.href = "/login";
        } catch (error) {
          console.error("Error bij login", error.message);
        }
      }
    },
    validationSchema: validationSchema,
  });

  return (
    <div className="flex justify-center h-screen items-center">
      <Formik>
        <Form
          className="bg-cyan-950 h-2/3 w-1/3 rounded-md"
          onSubmit={handleSubmit}
        >
          <h1 className="text-center text-white font-bold text-6xl pt-8 h-1/4">
            REGISTREER
          </h1>
          <div className="flex flex-col h-1/2">
            <div className="w-1/2 self-center relative pb-6">
              <Field
                type="text"
                name="voornaam"
                className="w-1/3 h-8 border-b border-white bg-transparent text-white absolute left-0 p-1"
                placeholder="Voornaam"
                value={values.voornaam}
                onChange={handleChange}
              />
              <Field
                type="text"
                name="achternaam"
                className="w-1/2 h-8 border-b border-white bg-transparent text-white absolute right-0 p-1"
                placeholder="Achternaam"
                value={values.achternaam}
                onChange={handleChange}
              />
            </div>
            <div className="pb-4 mt-8 w-full text-center relative">
              <Field
                type="email"
                name="email"
                className="w-1/2 h-8 border-b rounded-t-md border-white bg-transparent text-white p-1"
                placeholder="Email"
                value={values.email}
                onChange={handleChange}
              />
            </div>
            <div className="pt-6 w-full text-center relative">
              <Field
                type="password"
                name="password"
                className="w-1/2 h-8 border-b border-white bg-transparent text-white p-1"
                placeholder="Password"
                value={values.password}
                onChange={handleChange}
              />
            </div>
            <div className="pt-12 w-full text-center relative">
              <Field
                type="password"
                name="confirmPassword"
                className="w-1/2 h-8 border-b border-white bg-transparent text-white p-1"
                placeholder="Confirm password"
                value={values.confirmPassword}
                onChange={handleChange}
              />
            </div>
            <div className="text-center">
              <p
                className="text-red-500 pt-2"
                hidden={true}
                ref={errorEmailRef}
              >
                Email al in gebruik.
              </p>
              <p
                className="text-red-500 pt-2"
                hidden={true}
                ref={errorPasswordRef}
              >
                Wachtwoorden komen niet overeen.
              </p>
            </div>
          </div>
          <div className="h-1/4 pt-12">
            <div className="flex flex-wrap justify-center">
              <div className="px-4">
                <button
                  type="submit"
                  disabled={!isValid || !dirty}
                  className="bg-white text-cyan-950 border-2 border-cyan-950 py-1 px-3 rounded-md w-32 hover:bg-cyan-950 hover:text-white hover:border-white"
                >
                  Registreer
                </button>
              </div>
              <div className="px-4">
                <BackButton
                  onClick={() => {
                    navigate(-1);
                  }}
                />
              </div>
            </div>
          </div>
        </Form>
      </Formik>
    </div>
  );
};

export default RegisterPage;
