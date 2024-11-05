import { useEffect } from "react";
import backgroundEllipse from "/radialEllipseBackground.png";
import dashboardIcon from "/DashboardIcon.png";
import transactionsIcon from "/TransactionsIcon.png";
import statisticIcon from "/StatisticsIcon.png";

export default function Dashboard() {
  useEffect(() => {
    document.body.classList.add("overflow-hidden");

    return () => {
      document.body.classList.remove("overflow-hidden");
    };
  }, []);

  return (
    <>
      <img
        src={backgroundEllipse}
        alt="Background gradient"
        className="w-[50rem] -z-50 -top-10 -left-60 absolute select-none"
      />
      <img
        src={backgroundEllipse}
        alt="Background gradient"
        className="w-[50rem] -z-50 -bottom-64 left-60 absolute select-none"
      />
      <img
        src={backgroundEllipse}
        alt="Background gradient"
        className="w-[50rem] -z-50 -bottom-64 -right-10 absolute select-none"
      />
      <img
        src={backgroundEllipse}
        alt="Background gradient"
        className="w-[50rem] -z-50 -top-64 -right-56 absolute select-none"
      />
      <div>
        <div className="h-screen w-[15rem] fixed left-0 border rounded border-gray-600/40 bg-white/10 backdrop-blur-[6.3px]">
          <div className="ml-6 leading-[4rem] space-y-4 mt-3">
            <a
              href=""
              className="pl-4 flex items-center space-x-3 rounded-[0.3rem] hover:bg-[#171717] hover:w-[11rem]"
            >
              <img src={dashboardIcon} alt="Dashboard Icon" />
              <h2>Dashboard</h2>
            </a>
            <a
              href="/Transactions"
              className="pl-4 flex items-center space-x-3 rounded-[0.3rem] hover:bg-[#171717] hover:w-[11rem]"
            >
              <img src={transactionsIcon} alt="Transactions Icon" />
              <h2>Transactions</h2>
            </a>
            <a
              href=""
              className="pl-4 flex items-center space-x-3 rounded-[0.3rem] hover:bg-[#171717] hover:w-[11rem]"
            >
              <img src={statisticIcon} alt="Statistics Icon" />
              <h2>Statistics</h2>
            </a>
          </div>
        </div>

        <div className="ml-[6rem] flex">
          {/* Left Side: My Balance and Statistics */}
          <div className="space-y-6 w-full">
            <h3 className="mb-[3rem] text-sm">
              Welcome Back,
              <br />
            </h3>

            <div className="pl-5 rounded-md border-[3px] border-[rgba(62,62,62,0.4)] bg-[rgba(255,255,255,0.1)] backdrop-blur-[6.3px] w-[62rem] h-[12rem]">
              <h2 className="pt-10 text-2xl">
                My Balance
                <br />
              </h2>
            </div>

            <div className="rounded-sm bg-[#3E3E3E] w-64 h-32 text-center flex flex-col justify-center items-center ml-auto mr-auto">
              <div className="rounded-sm bg-[#171717] w-44 p-[0.8rem] flex justify-center items-center">
                <img src={statisticIcon} alt="Statistics Icon" />
              </div>

              <h2 className="mt-5 font-medium text-xl">Statistics</h2>
            </div>

            <div className="flex justify-between mt-10 w-[62rem]">
              <h1 className="font-bold text-2xl">Recent Transactions</h1>
              <a href="/Transactions">
                <h3 className="text-right underline">View All</h3>
              </a>
            </div>
          </div>

          <div className="flex flex-col items-end space-y-6 pr-10 ml-20">
            <div className="rounded-[0.6rem] p-5 border-2 border-[#3E3E3E] w-[18.6rem] h-[17rem]">
              <h2 className="text-[1.25rem] font-bold mb-5">Send Money</h2>
              <div className="relative mb-3">
                <input
                  type="email"
                  className="peer block min-h-[auto] w-[12rem] rounded-md border border-[#4D4D4D] bg-transparent px-3 py-[0.32rem] leading-[1.6] outline-none transition-all duration-200 ease-linear focus:border-[#ABABAB]"
                  id="username"
                  placeholder="Username"
                />
              </div>

              <div className="relative mb-3">
                <input
                  type="number"
                  className="peer block min-h-[auto] w-[12rem] rounded-md border border-[#4D4D4D] bg-transparent px-3 py-[0.32rem] leading-[1.6] outline-none transition-all duration-200 ease-linear focus:border-[#ABABAB]"
                  id="Amount"
                  placeholder="Enter Amount"
                />
              </div>

              <div className="relative mt-8 flex justify-center">
                <input
                  type="button"
                  value="Send Money"
                  className="bg-[#3E3E3E] text-white cursor-pointer font-medium py-2 px-4 rounded hover:bg-[#535353] transition duration-200 ease-in-out"
                />
              </div>
            </div>

            <div className="rounded-[0.6rem] p-5 border-2 border-[#3E3E3E] w-[18.6rem] h-[15rem]">
              <h2 className="text-[1.25rem] font-bold mb-5">Deposit</h2>
              <div className="relative mb-3">
                <input
                  type="number"
                  className="peer block min-h-[auto] w-[12rem] rounded-md border border-[#4D4D4D] bg-transparent px-3 py-[0.32rem] leading-[1.6] outline-none transition-all duration-200 ease-linear focus:border-[#ABABAB]"
                  id="Amount"
                  placeholder="Enter Amount"
                />
              </div>

              <div className="relative mb-3">
                <select
                  className="peer block min-h-[auto] w-[12rem] rounded-md border border-[#4D4D4D] bg-[#1520329f] text-white px-3 py-[0.32rem] leading-[1.6] outline-none transition-all duration-200 ease-linear focus:border-[#ABABAB] appearance-none"
                  defaultValue=""
                >
                  <option value="" disabled className="text-gray-400">
                    Choose a Category
                  </option>
                  <option value="food">Food</option>
                  <option value="education">Education</option>
                  <option value="transportation">Transportation</option>
                  <option value="bills">Bills</option>
                  <option value="shopping">Shopping</option>
                  <option value="friends_family">Friends & Family</option>
                  <option value="health">Health</option>
                </select>
              </div>

              <div className="relative mt-5 flex justify-center">
                <input
                  type="button"
                  value="Deposit"
                  className="bg-[#3E3E3E] text-white cursor-pointer font-medium py-2 px-4 rounded hover:bg-[#535353] transition duration-200 ease-in-out"
                />
              </div>
            </div>
            <div className="rounded-[0.6rem] p-5 border-2 border-[#3E3E3E] w-[18.6rem] h-[15rem]">
            <h2 className="text-[1.25rem] font-bold mb-5">Withdraw</h2>
              <div className="relative mb-3">
                <input
                  type="number"
                  className="peer block min-h-[auto] w-[12rem] rounded-md border border-[#4D4D4D] bg-transparent px-3 py-[0.32rem] leading-[1.6] outline-none transition-all duration-200 ease-linear focus:border-[#ABABAB]"
                  id="Amount"
                  placeholder="Enter Amount"
                />
              </div>

              <div className="relative mb-3">
                <select
                  className="peer block min-h-[auto] w-[12rem] rounded-md border border-[#4D4D4D] bg-[#1520329f] text-white px-3 py-[0.32rem] leading-[1.6] outline-none transition-all duration-200 ease-linear focus:border-[#ABABAB] appearance-none"
                  defaultValue=""
                >
                  <option value="" disabled className="text-gray-400">
                    Choose a Category
                  </option>
                  <option value="food">Food</option>
                  <option value="education">Education</option>
                  <option value="transportation">Transportation</option>
                  <option value="bills">Bills</option>
                  <option value="shopping">Shopping</option>
                  <option value="friends_family">Friends & Family</option>
                  <option value="health">Health</option>
                </select>
              </div>

              <div className="relative mt-5 flex justify-center">
                <input
                  type="button"
                  value="Withdraw"
                  className="bg-[#3E3E3E] text-white cursor-pointer font-medium py-2 px-4 rounded hover:bg-[#535353] transition duration-200 ease-in-out"
                />
              </div>
            </div>
          </div>
        </div>
      </div>
    </>
  );
}
