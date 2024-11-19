import { useEffect } from "react";
import backgroundEllipse from "/radialEllipseBackground.png";
import backgroundGradient from "/Gradient.png";



export default function Register() {
  useEffect(() => {
    document.body.classList.add("overflow-hidden");

    return () => {
      document.body.classList.remove("overflow-hidden");
    };
  }, []);

  return (
    <>
      <img
        src={backgroundGradient}
        alt="Background gradient"
        className="-z-50 left-[5rem] top-0 absolute select-none"
      />
      <img
        src={backgroundEllipse}
        alt="Background gradient"
        className="w-[50rem] -z-50 -left-60 absolute select-none"
      />
      <img
        src={backgroundEllipse}
        alt="Background gradient"
        className="-bottom-72 w-[50rem] -z-50 left-[36rem] absolute select-none"
      />
      <img
        src={backgroundEllipse}
        alt="Background gradient"
        className="-bottom-8 w-[50rem] -z-50 -right-52 absolute select-none"
      />
      <div className="mt-44">
        <div className="text-center mb-10">
          <h1 className="font-bold text-4xl mb-2">Register</h1>
          <p className="text-xl font-light text-[#CCCCCC] max-w-auto">
          We are excited to have you. Fill in the details below, and let<br></br>the journey begin!
          </p>
        </div>

        <div className="flex justify-center items-center">
          <div>
            <div className="relative mb-3">
              <input
                type="email"
                className="peer block min-h-[auto] w-[20rem] rounded-md border border-[#4D4D4D] bg-transparent px-3 py-[0.32rem] leading-[1.6] outline-none transition-all duration-200 ease-linear focus:border-[#ABABAB]"
                id="username"
                placeholder="Username"
              />
            </div>

            <div className="relative mb-3">
              <input
                type="password"
                className="peer block min-h-[auto] w-[20rem] rounded-md border border-[#4D4D4D] bg-transparent px-3 py-[0.32rem] leading-[1.6] outline-none transition-all duration-200 ease-linear focus:border-[#ABABAB]"
                id="password"
                placeholder="Password"
              />
            </div>
            
            <button className="mt-7 w-[20rem] mx-auto text-white font-bold bg-[#1877F2] p-2 rounded">
              Register
            </button>
            <h3 className="text-center mt-2 mr-2 font-light">
              Already have an account? 
              <a href="/Login">
                <span className="font-bold"> Login</span>
              </a>
            </h3>
          </div>
        </div>
      </div>
    </>
  );
}
