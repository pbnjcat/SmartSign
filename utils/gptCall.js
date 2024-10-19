import OpenAI from 'openai';

const openai = new OpenAI({
  baseURL: 'https://api.red-pill.ai/v1',
  apiKey: 'sk-VBlJkO3e97QJCYjvMN9iWOqiM01iQKqHmvEMN9RK6bnN01gv',
});

async function main() {
  const completion = await openai.chat.completions.create({
    messages: [{ role: 'user', content: 'What is the meaning of life?' }],
    model: 'gpt-4o',
  });

  console.log(completion.choices[0]);
}

main();
