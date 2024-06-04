import { zodResolver } from "@hookform/resolvers/zod"
import { useForm } from "react-hook-form"
import { z } from "zod"
 
import { Button } from "@/components/ui/button"
import {
  Form,
  FormControl,
  FormDescription,
  FormField,
  FormItem,
  FormLabel,
  FormMessage,
} from "@/components/ui/form"
import { Input } from "@/components/ui/input"
import { toast } from "@/components/ui/use-toast"


// The `FormSchema` object is a validation schema for a form. It's using the `zod` library for validation.
// Currently, it only contains one field, `username`, which is expected to be a string with a minimum length of 2.
// If the `username` field does not meet this requirement, it will return an error message: "Username must be at least 2 characters." 
const FormSchema = z.object({
  username: z.string().min(2, {
    message: "Username must be at least 2 characters.",
  }),
})

const App = () => {

  // Here, we're using the `useForm` hook from `react-hook-form` with a Zod schema (`FormSchema`) for form validation.
  // The `resolver` option is set to `zodResolver(FormSchema)`, which uses Zod to validate the form data.
  // The `defaultValues` option sets the initial value of `username` to an empty string. 
  const form = useForm<z.infer<typeof FormSchema>>({
    resolver: zodResolver(FormSchema),
    defaultValues: {
      username: "",
    },
  })

  // The `onSubmit` function is a handler for form submission. It takes the form data as an argument.
  // The form data is expected to match the shape of `FormSchema` (as inferred by `z.infer<typeof FormSchema>`).
  // Upon submission, it displays a toast notification with the submitted form values, formatted as a JSON string.

  function onSubmit(data: z.infer<typeof FormSchema>) {
    toast({
      title: "You submitted the following values:",
      description: (
        <pre className="mt-2 w-[340px] rounded-md bg-slate-950 p-4">
          <code className="text-white">{JSON.stringify(data, null, 2)}</code>
        </pre>
      ),
    })
  }

  return (
    <section className="bg-gradient_morph bg-fixed bg-no-repeat bg-center h-screen w-screen overflow-x-hidden">
      <div className="container h-full w-full flex items-center justify-center ">
        <div className="px-10 py-16 w-[400px] rounded-2xl bg-white">
          <Form {...form}>
            <form onSubmit={form.handleSubmit(onSubmit)} className="space-y-6">
            <FormField
              control={form.control}
              name="username"
              render={({ field }) => (
                <FormItem>
                  <FormLabel>Username</FormLabel>
                  <FormControl>
                    <Input placeholder="Rick" {...field} />
                  </FormControl>
                  <FormDescription>
                    This is your public display name.
                  </FormDescription>
                  <FormMessage />
                </FormItem>
              )}
            />
            <Button type="submit">Submit</Button>
          </form>
        </Form>
        </div>
      </div>

    </section>
  )
}

export default App
